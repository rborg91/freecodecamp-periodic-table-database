This repository contains the fourth project for the Relational Database course on FreeCodeCamp. It includes a `.sql` dump file that can be loaded into a database for practice. To load the dump file, you can use the MySQL or PostgreSQL command line by running `mysql -u [username] -p [database_name] < periodic_table.sql` or `psql -U [username] -d [database_name] -f periodic_table.sql`. Alternatively, graphical tools can be used to import the file through their respective import options.

### Running the scripts

- `element.sh` - This script finds information on an element based on the argument provided. Run it using: `./element.sh` in a bash terminal along with either the number of the element, the symbol, or the actual element name.
  E.g. If you run `./element.sh 1`, `./element.sh H`, or `./element.sh Hydrogen`, it should output `The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius`.
