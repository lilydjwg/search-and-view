Tools to make searching and viewing easy.

For a Chinese introduction, see `my blog article`_.

阅读中文版介绍，请看\ `我的博客文章`_\ （有点旧了）。

Overview
--------

* ``rgg``/``rgv``: `ripgrep`_ wrappers to make it easy to open files as matching places
* ``vv``: A Vim / gVim wrapper to open files in existing gVim instances and then move the cursor to specified location

Dependencies
------------

* Python >= 3.8
* `ripgrep`_
* the `setproctitle`_ Python library (optional)
* ``vv`` requires Vim or gVim with ``+clientserver`` feature

Arch Linux users can install ``search-and-view-git`` from AUR (thanks to @acgtyrant).

Configuration
-------------

Use the ``AGV_EDITOR`` environmental variable to spefify your preferred editor
for ``agv``. It's taken as a shell command template string and the following is
recognized:

* ``$file``: The file path.
* ``$line``: The line number.
* ``$col``: The column number.

For example::

  # uses 'vv'
  export AGV_EDITOR='vv $file:$line:$col'
  # uses 'vim'
  export AGV_EDITOR='vim +$line $file'

Usage
-----

``rgg`` and ``agv``
^^^^^^^^^^^^^^^^^^^
Just use ``rgg`` as ``rg`` to search text (Searching in filenames ``-g`` won't work).

Use ``rgv N`` to open the result numbered ``N``. You can use ``rgv`` without arguments 
to view the list again. The list is per terminal (tty).

If your `terminal supports hyperlinks`_, you'll be able to click the
highlighted match to jump to it, provided that ``vv.desktop`` is properly
installed (i.e. copied to ``~/.local/share/applications``).

``vv``
^^^^^^
you can give a line number and a column number after a colon, like this::

  vv file:33
  vv file:12:902

Or paste the line from a Python traceback::

  vv 'File "/usr/lib/python3.4/sre_parse.py", line 358, in _parse_sub'

You don't need the full line. Just enough info will do::

  vv '/usr/lib/python3.4/sre_parse.py", line 358'

If you are on Linux and use zsh, I suggest the following alias::

  alias -g XS='"$(xsel)"'

Then you can just select the line and do::

  vv XS

You can pass the ``--wait`` flag to wait for Vim to finish editing the file
(useful for programs that waits for editing to finish).

Use the ``--vim NAME`` option to spefify a Vim instance (default is the first one found).

License
-------

GPLv3+.

.. _ag: https://github.com/ggreer/the_silver_searcher
.. _ripgrep: https://github.com/BurntSushi/ripgrep
.. _setproctitle: https://github.com/dvarrazzo/py-setproctitle
.. _my blog article:
.. _我的博客文章: https://blog.lilydjwg.me/2014/7/18/search-and-view-quickly.53141.html
.. _terminal supports hyperlinks: https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda
