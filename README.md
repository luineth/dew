# dew - an AWK Getting Things Done todo list formatter

## Dependencies:
- Python
- [Croniter](https://github.com/pallets-eco/croniter), installed by `pip install croniter`
- `date`, probably GNU-flavored
- GNU AWK

## "Installation" (insofar as you need to install anything):

1. `mkdir -p $HOME/bin`
2. `cd $HOME/bin`
3. `git clone git@github.com:luineth/dew.git`
4. `cd $HOME/bin/dew`
5. `make install` will symlink the todo list syntax files into your `vim` directory

Once installed, type `<leader> F` inside any `.dew` file to format!
