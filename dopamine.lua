name = 'zlib'
version = '1.2.12'
description = 'A Massively Spiffy Yet Delicately Unobtrusive Compression Library'
authors = {'Jean-loup Gailly', 'Mark Adler'}
license = 'MIT'
copyright = 'Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler'
langs = {'c'}

function source ()
    local folder = 'zlib-' .. version
    local archive = folder .. '.tar.gz'
    local url = 'https://github.com/madler/zlib/archive/refs/tags/v' .. version .. '.tar.gz'

    dop.download { url, dest = archive }
    dop.checksum { archive, sha1 = '09211da41528f4a7bc01890eeb0577af2bc0ec26' }
    dop.extract_archive { archive, outdir = '.' }

    return folder
end

function build (dirs, config)
    local cmake = dop.CMake:new(config.profile)

    cmake:configure{ src_dir = dirs.src, install_dir = dirs.install }
    cmake:build()
    cmake:install()
end
