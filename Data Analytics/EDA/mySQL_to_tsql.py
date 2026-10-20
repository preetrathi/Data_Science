import re

def convert_mysql_to_tsql(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()

    # 1. Remove MySQL-specific table options and engine settings
    content = re.sub(r'\)\s*ENGINE=[^;]+;', ');', content, flags=re.IGNORECASE)
    content = re.sub(r'DEFAULT CHARSET=[^\;\s]+', '', content, flags=re.IGNORECASE)
    content = re.sub(r'DEFAULT COLLATE=[^\;\s]+', '', content, flags=re.IGNORECASE)
    content = re.sub(r'AUTO_INCREMENT=\d+', '', content, flags=re.IGNORECASE)
    content = re.sub(r'COLLATE\s+[^\s\,]+', '', content, flags=re.IGNORECASE)
    content = re.sub(r'CHARACTER SET\s+[^\s\,]+', '', content, flags=re.IGNORECASE)

    # 2. Convert MySQL AUTO_INCREMENT definitions to SQL Server IDENTITY(1,1)
    content = re.sub(r'int\(\d+\)\s+unsigned\s+NOT NULL\s+AUTO_INCREMENT', 'INT IDENTITY(1,1) NOT NULL', content, flags=re.IGNORECASE)
    content = re.sub(r'NOT NULL\s+AUTO_INCREMENT', 'IDENTITY(1,1)', content, flags=re.IGNORECASE)

    # 3. Replace backticks (`) with square brackets ([]) for identifiers
    content = re.sub(r'`([^`]+)`', r'[\1]', content)

    # 4. Handle MySQL specific quotes or boolean flags if any (e.g., tinyint(1))
    content = re.sub(r'tinyint\(1\)', 'TINYINT', content, flags=re.IGNORECASE)

    # 5. Insert GO batch separators after semicolons for SQL Server execution
    content = content.replace(';\r\n', ';\r\nGO\r\n')
    content = content.replace(';\n', ';\nGO\n')

    # Write the converted content out with a database creation wrapper
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'world')\n")
        f.write("BEGIN\n    CREATE DATABASE world;\nEND\nGO\n\n")
        f.write("USE world;\nGO\n\n")
        f.write(content)

    print(f"Conversion complete! Output saved to '{output_file}'.")

if __name__ == '__main__':
    # Change 'world.sql' to your actual source filename if different
    convert_mysql_to_tsql('data/world_cities.sql', 'world_sql_server.sql')