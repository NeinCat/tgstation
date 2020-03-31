/datum/job/prisoner
	title = "Prisoner"
	flag = PRISONER
	department_head = list("The Vigilia Team")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 0
	spawn_positions = 2
	social_class = SOCIAL_CLASS_MIN
	supervisors = "the vigilia team"

	outfit = /datum/outfit/job/prisoner

	display_order = JOB_DISPLAY_ORDER_PRISONER

/datum/outfit/job/prisoner
	name = "Prisoner"
	jobtype = /datum/job/prisoner

	uniform = /obj/item/clothing/under/rank/prisoner
	shoes = /obj/item/clothing/shoes/sneakers/orange
	id = /obj/item/card/id/prisoner
	ears = null
	belt = null
