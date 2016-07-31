Tools to make searching and viewing easy.

For a Chinese introduction, see `my blog article`_.

阅读中文版介绍，请移步\ `我的博客文章`_\ 。

Overview
--------

* ``agg``/``agv``: `ag`_ wrappers to make it easy to open files as matching places
* ``vv``: A gVim wrapper to open files in existing gVim instances and then move
  the cursor to specified location

Dependencies
------------

* ``agg``: Bash, `ag`_, and several other common command-line tools.
* ``agv``: Python 3, `setproctitle`_ library for changing the process name (optional).
* ``vv``: Python 3, the `zenity`_ utility, Vim or gVim with ``+clientserver`` feature.

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

``agg`` and ``agv``
^^^^^^^^^^^^^^^^^^^
Just use ``agg`` as ``ag`` to search text (Searching in filenames ``-g`` won't work).

Use ``agv N`` to open the result numbered ``N``. You can use ``agv`` without arguments 
to view the list again. The list is per terminal (tty).

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

License
-------

GPLv3+.

.. _ag: https://github.com/ggreer/the_silver_searcher
.. _setproctitle: http://code.google.com/p/py-setproctitle/
.. _zenity: https://help.gnome.org/users/zenity/stable/
.. _my blog article:
.. _我的博客文章: http://blog.lilydjwg.me/2014/7/18/search-and-view-quickly.53141.html
