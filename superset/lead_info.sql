--lead info

CREATE VIEW superset.lead_info AS
(
	SELECT
		ent.lead_id, 
		ld.project_id,
		ld.created_at,
		ld.source,
		ld.website,
		ld.source_type,
		pj.id, 
		pj.title AS "project_title",
		usr.email,
		usr.first_name || ' ' || usr.last_name AS "name_of_user",
		SUBSTRING(usr.email from '@(.*).com') as "email_domain"
	FROM entry_entry ent
	JOIN lead_lead ld
	ON ent.lead_id = ld.id
	JOIN project_project pj
	ON pj.id = ld.project_id
	JOIN auth_user usr
	ON ld.created_by_id = usr.id
	LIMIT 100
)