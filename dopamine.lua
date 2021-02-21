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

function build(dirs, config)
    local cmake = dop.CMake:new(config.profile)

    dop.mkdir {dirs.build, recurse = true}

    dop.from_dir(dirs.build, function()
        cmake:configure{
            src_dir = dop.path(dirs.src),
            install_dir = dop.path(dirs.install)
        }
        cmake:build()
        cmake:install()
    end)

    return true
end
