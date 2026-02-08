# Supabase Database Functions

> Source: https://supabase.com/docs/guides/database/functions

## Overview

PostgreSQL supports SQL functions that reside in your database and can be invoked via the Supabase API.

## Basic Function

```sql
CREATE OR REPLACE FUNCTION hello_world()
RETURNS TEXT
LANGUAGE sql
AS $$
  SELECT 'hello world';
$$;
```

## Components

- **Declaration**: Function name and parameters
- **Return type**: Output data type (`void` for no return)
- **Language**: `sql`, `plpgsql`, `plpython`, etc.
- **Wrapper**: `$$` delimiters
- **Body**: Function logic

## Returning Data Sets

```sql
CREATE OR REPLACE FUNCTION get_planets()
RETURNS SETOF planets
LANGUAGE sql
AS $$
  SELECT * FROM planets;
$$;
```

Filter results: `SELECT * FROM get_planets() WHERE id = 1;`

## Parameters and Logic (plpgsql)

```sql
CREATE OR REPLACE FUNCTION add_planet(name TEXT)
RETURNS BIGINT
LANGUAGE plpgsql
AS $$
DECLARE
  new_row BIGINT;
BEGIN
  INSERT INTO planets(name)
  VALUES (add_planet.name)
  RETURNING id INTO new_row;
  RETURN new_row;
END;
$$;
```

## Security

- **Default**: `SECURITY INVOKER` (executes as caller)
- **Alternative**: `SECURITY DEFINER` (executes as creator)
  - Must include explicit `search_path`

```sql
CREATE FUNCTION my_function()
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  -- function body
END;
$$;
```

## Error Handling

```sql
-- Logging
RAISE LOG 'Informational message';
RAISE WARNING 'Warning message';
RAISE EXCEPTION 'Error: %', error_detail;

-- Exception handling
BEGIN
  -- operation
EXCEPTION
  WHEN others THEN
    RAISE EXCEPTION 'Custom error: %', SQLERRM;
END;

-- Assertions
ASSERT condition, 'Assertion failed message';
```

## Permissions

```sql
-- Grant execution
GRANT EXECUTE ON FUNCTION my_function TO my_role;

-- Revoke execution
REVOKE EXECUTE ON FUNCTION my_function FROM public;
```

## J-Bridge Project Functions

### Auto-create profile on user signup
```sql
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO profiles (id, email, full_name, avatar_url)
  VALUES (
    NEW.id, NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'full_name', ''),
    COALESCE(NEW.raw_user_meta_data->>'avatar_url', '')
  );
  INSERT INTO japanese_skills (user_id) VALUES (NEW.id);
  INSERT INTO coding_skills (user_id) VALUES (NEW.id);
  INSERT INTO attitude_culture_skills (user_id) VALUES (NEW.id);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
```

### Auto-update timestamps
```sql
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```
