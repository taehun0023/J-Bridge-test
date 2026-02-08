# Supabase Row Level Security (RLS)

> Source: https://supabase.com/docs/guides/auth/row-level-security

## Overview

RLS adds implicit WHERE clauses to queries, filtering results based on defined policies.

## Enabling RLS

```sql
ALTER TABLE public.my_table ENABLE ROW LEVEL SECURITY;
```

## Policy Types

### SELECT (Read)

```sql
CREATE POLICY "Public profiles are visible to everyone."
  ON profiles FOR SELECT
  TO anon
  USING (true);
```

### INSERT (Create)

```sql
CREATE POLICY "Users can create a profile."
  ON profiles FOR INSERT
  TO authenticated
  WITH CHECK ((SELECT auth.uid()) = user_id);
```

### UPDATE (Modify)

```sql
CREATE POLICY "Users can update their own profile."
  ON profiles FOR UPDATE
  TO authenticated
  USING ((SELECT auth.uid()) = user_id)
  WITH CHECK ((SELECT auth.uid()) = user_id);
```

Note: UPDATE requires an accompanying SELECT policy.

### DELETE (Remove)

```sql
CREATE POLICY "Users can delete a profile."
  ON profiles FOR DELETE
  TO authenticated
  USING ((SELECT auth.uid()) = user_id);
```

## Helper Functions

- `auth.uid()` — Returns authenticated user's ID; `null` for unauthenticated
- `auth.jwt()` — Access JWT claims

## Best Practices

### Explicit NULL Checks

```sql
USING (auth.uid() IS NOT NULL AND auth.uid() = user_id)
```

### Roles

- `anon` — unauthenticated requests
- `authenticated` — logged-in users

Use `TO` clause to target specific roles.

## Performance Optimization

- **Add indexes** on columns referenced in policies
- **Wrap functions** with `SELECT` for caching:
  ```sql
  USING ((SELECT auth.uid()) = user_id)  -- cached
  -- vs
  USING (auth.uid() = user_id)            -- not cached
  ```
- **Filter explicitly** in queries, not just via policies
- **Use security definer functions** for intermediate tables
- **Minimize joins** in policies
- **Specify roles** with `TO` clause

## Views and RLS

Views as `postgres` bypass RLS. In Postgres 15+:

```sql
CREATE VIEW my_view
WITH (security_invoker = true)
AS SELECT * FROM my_table;
```

## Bypassing RLS

- Service keys bypass RLS (never expose in client code)
- Custom roles: `ALTER ROLE "role_name" WITH BYPASSRLS;`

## MFA Integration

```sql
CREATE POLICY "Restrict updates."
  ON profiles AS RESTRICTIVE FOR UPDATE
  TO authenticated
  USING ((SELECT auth.jwt()->>'aal') = 'aal2');
```
