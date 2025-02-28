begin;

    create table blog(id int, name text);


    with order_by_ast(order_by_arg) as (
        select
            graphql.ast_pass_strip_loc((graphql.parse($$
        {
            accounts (orderBy: [{id: AscNullsLast}, {name: DescNullsFirst}] ){
                unused
            }
        }
        $$)).ast::jsonb) -> 'definitions' -> 0 -> 'selectionSet' -> 'selections' -> 0 -> 'arguments' -> 0
    )

    select
        graphql.order_by_clause(
            order_by_arg := order_by_arg,
            entity := 'public.blog'::regclass,
            alias_name := 'xyz',
            reverse := false
        )
    from order_by_ast;


rollback;


