local dop = require('dop')

name = 'zlib'
version = '1.2.11'
description =
    'A Massively Spiffy Yet Delicately Unobtrusive Compression Library'
authors = {'Jean-loup Gailly', 'Mark Adler'}
license = 'MIT'
copyright = 'Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler'
langs = {'c'}

revision = dop.Git.revision()

function source()
    local folder = 'zlib-' .. version
    local archive = folder .. '.tar.gz'

    dop.download {url = 'https://zlib.net/' .. archive, dest = archive}
    dop.checksum {archive, sha1 = 'e6d119755acdf9104d7ba236b1242696940ed6dd'}
    dop.extract_archive {archive = archive, outdir = '.'}

    return folder
end

function build(dirs, profile)
    local cmake = dop.CMake:new(profile)

    dop.from_dir(dirs.src, function()
        local build = dop.path('build', profile.digest_hash)
        dop.mkdir {build, recurse = true}
        dop.from_dir(build, function()
            cmake:configure{
                src_dir = dop.path('..', '..'),
                install_dir = dirs.install,
            }
            cmake:build()
            cmake:install()
        end)
    end)
end
