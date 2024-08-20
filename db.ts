import { Pool } from 'pg';
import { environment } from './src/environments/environment';

export const pool = new Pool({
  host: environment.dbHost,
  port: parseInt(environment.dbPort),
  database: environment.dbName,
  user: environment.dbUser,
  password: environment.dbPassword,
  ssl: false
});