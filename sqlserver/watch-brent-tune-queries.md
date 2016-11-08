http://www.brentozar.com/go/tunequeries

# First steps

* Blitz

* How much time should I spend on this?

* Capture query metrics

* Read metrics and plan

* Experiment with simple stupid things to test
    * Try removing ORDER BY. If it works, order in the app.
    * Try `SELECT 1`, if it works, try reducing selected fields.

* Execution plan
    * Top-right: driver
    * Plan's optimization level: did SQL server take a lot of time to build the plan?

* Parallellism opportunities

* Index improvements
    * Prefer changing the query to match the database, not vice versa (indexes = more overhead)


# Tuning

* SET STATISTICS IO ON

* _Actual_ execution plan

    * Estimated plan is garbage
        * 

    * SSMS 2016 - Include live query statistics
        * Cool, but buggy
        * Might have to open the live execution plan from Activity Monitor

    * The "query cost relative to the batch" is based on estimate, even when looking at actual plan

* Top-right is the "driver table"

* Copy statistics into http://statisticsparser.com/

    * Logical reads = first thing to look at?
    * Use to measure how much better the query is, instead of clock time

* Table variable = evil

    * Causes estimated number of rows = 1
    * Still logged, could be tempdb, etc.
    * Use temp tables instead

* Yellow warning icon - spilling data to disk

    * Eliminating a hash match - indexes, indexed views
