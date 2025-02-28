begin;
    create table account(
        _id serial primary key,
        id int,
        "spiritAnimal" text
    );

    insert into public.account(id, "spiritAnimal")
    values
        (1, 'bat'),
        (2, 'aardvark'),
        (3, 'aardvark'),
        (null, 'cat');


    -- Single sort

    -- AscNullsFirst
    select jsonb_pretty(
        graphql.resolve($$
            {
              allAccounts(orderBy: [{id: AscNullsFirst}]) {
                edges {
                  node {
                    id
                  }
                }
              }
            }
        $$)
    );

    -- AscNullsLast
    select jsonb_pretty(
        graphql.resolve($$
            {
              allAccounts(orderBy: [{id: AscNullsLast}]) {
                edges {
                  node {
                    id
                  }
                }
              }
            }
        $$)
    );


    -- DescNullsFirst
    select jsonb_pretty(
        graphql.resolve($$
            {
              allAccounts(orderBy: [{id: DescNullsFirst}]) {
                edges {
                  node {
                    id
                  }
                }
              }
            }
        $$)
    );


    -- DescNullsLast
    select jsonb_pretty(
        graphql.resolve($$
            {
              allAccounts(orderBy: [{id: DescNullsLast}]) {
                edges {
                  node {
                    id
                  }
                }
              }
            }
        $$)
    );

    -- Variable: AscNullsFirst
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: OrderByDirection)
           {
             allAccounts(orderBy: [{id: $direction}]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"direction": "AscNullsFirst"}'
      )
    );

    -- Variable: AscNullsLast
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: OrderByDirection)
           {
             allAccounts(orderBy: [{id: $direction}]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"direction": "AscNullsLast"}'
      )
    );

    -- Variable: DescNullsFirst
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: OrderByDirection)
           {
             allAccounts(orderBy: [{id: $direction}]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"direction": "DescNullsFirst"}'
      )
    );

    -- Variable: DescNullsLast
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: OrderByDirection)
           {
             allAccounts(orderBy: [{id: $direction}]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"direction": "DescNullsLast"}'
      )
    );

    -- Variable: Invalid
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: OrderByDirection)
           {
             allAccounts(orderBy: [{id: $direction}]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"direction": "InvalidChoice"}'
      )
    );

    -- Variable: Missing
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: OrderByDirection)
           {
             allAccounts(orderBy: [{id: $direction}]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{}'
      )
    );

    -- Variable Whole Param: AscNullsFirst
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: [AccountOrderBy])
           {
             allAccounts(orderBy: $direction) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"direction": [{"id": "AscNullsFirst"}]}'
      )
    );

    -- Variable Whole Param: AscNullsLast
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: [AccountOrderBy])
           {
             allAccounts(orderBy: $direction) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"direction": [{"id": "AscNullsLast"}]}'
      )
    );


    -- Variable Whole Param: DescNullsFirst
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: [AccountOrderBy])
           {
             allAccounts(orderBy: $direction) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"direction": [{"id": "DescNullsFirst"}]}'
      )
    );


    -- Variable Whole Param: DescullsLast
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: [AccountOrderBy])
           {
             allAccounts(orderBy: $direction) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"direction": [{"id": "DescNullsLast"}]}'
      )
    );


    -- Variable Whole Param: Invalid, null
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: [AccountOrderBy])
           {
             allAccounts(orderBy: $direction) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"direction": null}'
      )
    );

    -- Variable Whole Param: Invalid, empty list
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($direction: [AccountOrderBy])
           {
             allAccounts(orderBy: $direction) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"direction": []}'
      )
    );

    -- Variable Entry: {"id": "AscNullsFirst"}
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($ent: AccountOrderBy!)
           {
             allAccounts(orderBy: [$ent]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"ent": {"id": "AscNullsFirst"}}'
      )
    );

    -- Variable Entry: {"id": "AscNullsLast"}
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($ent: AccountOrderBy!)
           {
             allAccounts(orderBy: [$ent]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"ent": {"id": "AscNullsLast"}}'
      )
    );

    -- Variable Entry: {"id": "DescNullsFirst"}
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($ent: AccountOrderBy!)
           {
             allAccounts(orderBy: [$ent]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"ent": {"id": "DescNullsFirst"}}'
      )
    );

    -- Variable Entry: {"id": "DescNullsLast"}
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($ent: AccountOrderBy!)
           {
             allAccounts(orderBy: [$ent]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"ent": {"id": "DescNullsLast"}}'
      )
    );

    -- Variable Entry: Invalid Missing
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($ent: AccountOrderBy!)
           {
             allAccounts(orderBy: [$ent]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{}'
      )
    );

    -- Variable Entry: Invalid List
    select jsonb_pretty(
        graphql.resolve($$
           query AccountsOrdered($ent: AccountOrderBy!)
           {
             allAccounts(orderBy: [$ent]) {
               edges {
                 node{
                   id
                 }
               }
             }
           }
        $$,
        variables:= '{"ent": "[]"}'
      )
    );

rollback;
