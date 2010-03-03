Requirements
==============

- JRuby 1.4.0
- Rubygems
    - Rake
    - Thor
- Cappuccino Tools
    - git clone git://github.com/280north/cappuccino.git && cd cappuccino
    - sudo ./bootstrap.sh   (installs narwhaljs and support tools)
    - jake sudo-install
- Titanium SDK (Install Titanium Developer)
- Python


Building
===========

To see options:

    $ rake -T

To build & run on OSX:

    $ rake yogo:desktop:osx:run