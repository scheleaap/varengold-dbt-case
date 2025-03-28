Commands:
```
duckdb -cmd "ATTACH 'transformation/casestudy.duckdb';" -ui
```

Other problems:
* ERD: `customers` has a superfluous column `account_id`. (`customers` and `accounts` both reference each other (implies a 1-1 relationship), but the notation says 1 to many.)
* Error setting up dev container:
    ```
    fatal: not in a git directory
    [42790 ms] onCreateCommand from devcontainer.json failed with exit code 128. Skipping any further user-provided commands.
    [42793 ms] Error: Command failed: /bin/bash -i -c chmod +x .devcontainer/onCreateCommand.sh && .devcontainer/onCreateCommand.sh
    ```

Data problems:
* `raw.fx_rates.currency_iso_code` starts with whitespace
* `raw.accounts`
    * `account_type` contains empty strings
    * `account_opening_date` contains empty strings
* `raw.loans`
    * Typo in column name `loant_type`
    * ✅ Different date formats in `approval_rejection_date`
* `raw.customer`
    * `customer_id` not unique (5000 unique, 10000 total): all rows duplicate
* `raw.transaction`
    * `transaction_date` is varchar instead of date
    * `transaction_amount` is varchar instead of number, decimal separator is "," instead of "."

Thoughts on dbt:
* data tests vs. unit tests
* SQL templating 😢
* How do you guarantee the model and its documentation are in sync?
* Streaming?

Interesting articles:
* https://www.reddit.com/r/dataengineering/comments/zamewl/whats_wrong_with_dbt/
* https://www.reddit.com/r/dataengineering/comments/t0fls9/dbt_vs_rpython_for_transformation/
* https://posthog.com/blog/modern-data-stack-sucks
* https://ploomber.io/blog/sql/
* https://dev.to/sudo_pradip/dbt-vs-data-engineers-a-love-hate-saga-218e
