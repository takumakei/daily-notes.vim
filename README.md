# daily-notes.vim

Small vim plugin for writing daily notes.

## `:DailyNotes [day offset]`

Open daily notes files. names are `~/daily-notes/YYYY/YYYY-MM-DD(Day).md`

For example:

`:DailyNotes` opens today's notes.
`:DailyNotes -1` opens yesterday's notes.

The directory can be changed by `g:daily_notes_base` like below:

```
let g:daily_notes_base = "~/Documents/Memo"
```

## `:DailyNotesHeader`

![normal mode: &lt;Leader&gt;dh](https://img.shields.io/badge/normal_mode-%3CLeader%3Edh-green.svg?style=flat-square) ![insert mode: &lt;C-&#x005d;&gt;h](https://img.shields.io/badge/insert_mode-%3CC--%5D%3Eh-green.svg?style=flat-square)

Insert header block like below:

```
----------------------------------------------------------------------

[YYYY-MM-DD hh:mm:ss]
```

## `:DailyNotesTimeStamp`

![normal mode: &lt;Leader&gt;dt](https://img.shields.io/badge/normal_mode-%3CLeader%3Edt-green.svg?style=flat-square) ![insert mode: &lt;C-&#x005d;&gt;t](https://img.shields.io/badge/insert_mode-%3CC--%5D%3Et-green.svg?style=flat-square)

Insert time stamp like below:

```
[YYYY-MM-DD hh:mm:ss]
```

# License

Copyright (c) 2015 takumakei

This software is released under the [MIT License](http://opensource.org/licenses/mit-license.php).
