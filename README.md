# dew - an AWK Getting Things Done todo list formatter

`dew` is a linter for a GTD-like task list of the same name. It reads from the standard input and prints to the standard output. `dew` is best combined with other tools, especially a syncing mechanism and a way to call the program from within a text editor. A vim local leader remap and syntax file are included in this repo.

## .dew files

### Principles

1. **Each task is represented by one line.**
2. **All tasks belong to projects.** Projects in GTD should have a stated outcome. For trivial projects (i.e. single-task projects), the completion of the task *is* the project outcome.
3. **Each project is represented by a paragraph.** Blank lines form the boundaries between projects.
4. **All projects must have a hook.** Legal projects have at least one "hook" task. Valid hooks task have the status "next" or have a follow-up date.
5. **Task state is represented by one-character sigils.** These are the first character of the line.

### Quick reference

| Characters | Meaning   |
| ----- | --------- |
| `>`   | next      |
| `$`   | scheduled |
| `%`   | delegated |
| `~`   | done      |
| `:`   | machine comment (disregarded as input) |
| `:!`  | lints (comments that require attention) |


### Task statuses

Tasks have one of the following states:

**Next**: You can immediately do this task. Prefixed with a `>` sigil. Optionally, it may contain one or more **contexts**, which are words beginning with `@`. A list of active contexts is tracked at the top of the `.dew` file automatically.

```
>get groceries @errand
```

**Scheduled**: These become active on a particular date. (All dates are `YYYY-MM-DD`.) Scheduled tasks use a `$` sigil. They also must have a date, otherwise `dew` will complain.

```
$meet with april 2027-03-08
```

**Delegated**: Like scheduled tasks, you can't work on delegated tasks. The depend on a person rather than a time. They begin with `%`, and the person they're delegated to immediately follows. For example:

```
%jason clean the toilet (because I don't want to) 2030-01-02
```

All delegated tasks must be guarded with a follow-up date. This represents a time to check in if that person hasn't done what you delegated to them.

**Done** tasks are begin with `~`.

All other tasks are implicitly **pending**. Pending tasks are those which come later in the project and are blocked by other tasks. `dew` will indent pending tasks with a space, but is just cosmetic. Any non-reserved first characters give the take a pending status.

Any task may contain a repetition cadence. They come in two flavors, absolute and relative. Absolute repeats are calculated from the last scheduled date, and relative repeats are calculated from today. For example:

```
>deposit paycheck [2 weeks]

>clean the stove +[month]
```

You can read repeat expressions in your head as "every X." `[monday]` means "every monday". `+[week]` means "every week from today".

`dew` calculates repeated tasks after you mark them done. It will first "cancel" the done task by printing it with a final `~`, then it will create a new task with the following scheduled date.

Repetitions are calculated via the robust relative dating in GNU `date`. See that info page for more, but in short, these are some valid repeat expressions:

- `[wed]`
- `[friday]`
- `[day]`
- `[2 weeks]`
- `[ 1 month ]`
- `[3 years 2 months 1 week 4 days]`

Plurals are ignored. Days of the week must be alone. All other dates can optionally take an integer and be combined. `date` allows from strange but perfectly valid expressions:

- `[year month years months 2 day]` -> 2 years + 2 months + 2 days

### Project statuses

You don't set project statuses; they are derived from the child task statuses. Projects are ordered in descending urgency:

1. **Live** projects have at least one next task.
2. **Dormant** projects have at least one follow-up task (i.e. scheduled or delegated).
3. **Completed** projects have only done tasks.

## "Installation" (insofar as you need to install anything):

GNU coreutils is a prerequisite.

1. `mkdir -p $HOME/bin`
2. `cd $HOME/bin`
3. `git clone git@github.com:luineth/dew.git`
4. `cd $HOME/bin/dew`
5. `make install` will symlink the todo list syntax files into your `vim` directory

Once installed, type `<leader> f` inside any `.dew` file to format.
