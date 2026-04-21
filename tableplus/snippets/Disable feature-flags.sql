update app_setting set value = 0 where setting in (
	'keycloak_active',
	'registrations_in_row',
	'elog_flow_enabled',
	'elog_connections_enabled',
	'chapter_mail_subscription_enabled',
	'probe_module_enabled',
	'popups_enabled',
	'keycloak_session_creation_enabled',
	'try_new_login_page_enabled',
	'module_selector_enabled',
	'menu_enabled',
	'remote_iframe_tablet_access_enabled',
	'full_keycloak_enabled',
	'invalidate_safe_session',
	'enable_hardware_tab',
	'sync_vacation_changes_to_foodwaste'
);

update app_setting set value = 1 where setting in (
	'keycloak_active',
	'registrations_in_row',
	'elog_flow_enabled',
	'elog_connections_enabled',
	'chapter_mail_subscription_enabled',
	'probe_module_enabled',
	'popups_enabled',
	'keycloak_session_creation_enabled',
	'try_new_login_page_enabled',
	'module_selector_enabled',
	'menu_enabled',
	'remote_iframe_tablet_access_enabled',
	'full_keycloak_enabled',
	'invalidate_safe_session',
	'enable_hardware_tab',
	'sync_vacation_changes_to_foodwaste'
);

