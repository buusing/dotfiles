UPDATE migration_versions
SET version = REGEXP_REPLACE(
    version,
    '^Application\\\\Migrations\\\\Version',
    ''
)
WHERE version LIKE 'Application\\\%';

UPDATE migration_versions
SET version = CONCAT('Application\\Migrations\\Version', version) WHERE version not LIKE 'Application\\\%';