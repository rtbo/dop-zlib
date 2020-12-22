local dop = require('dop')

name = "zlib"
version = "1.2.11"
description =
    "A Massively Spiffy Yet Delicately Unobtrusive Compression Library"
authors = {"Jean-loup Gailly", "Mark Adler"}
license = "MIT"
copyright = "Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler"
langs = { "c" }

repo = dop.Git {
    url = "https://github.com/rtbo/dop-zlib.git",
    revId = "main"
}

source = dop.Archive {
    url = "https://zlib.net/zlib-1.2.11.tar.gz",
    sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1"
}

build = dop.CMake {}
