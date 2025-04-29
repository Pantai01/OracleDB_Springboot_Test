DECLARE
    v_sprint_id NUMBER;

    v_project_id NUMBER;

    v_employee_1 NUMBER;
    v_employee_2 NUMBER;
    v_employee_3 NUMBER;
    v_employee_4 NUMBER;
    v_employee_5 NUMBER;
    v_employee_6 NUMBER;

    v_todoitem_1 NUMBER;
    v_todoitem_2 NUMBER;
    v_todoitem_3 NUMBER;
    v_todoitem_4 NUMBER;
    v_todoitem_5 NUMBER;
    v_todoitem_6 NUMBER;
    v_todoitem_7 NUMBER;
    v_todoitem_8 NUMBER;
    v_todoitem_9 NUMBER;
    v_todoitem_10 NUMBER;
    v_todoitem_11 NUMBER;
    v_todoitem_12 NUMBER;
    v_todoitem_13 NUMBER;

BEGIN

    --Get project--

    SELECT PROJECT_ID INTO v_project_id
    FROM TODOUSER.PROJECT
    WHERE NAME = 'TEAM 11 Oracle Java';

    --Sprint--
    INSERT INTO TODOUSER.SPRINT(PROJECT_ID, NAME, START_DATE, END_DATE)
    VALUES(v_project_id, 'Sprint 3 (week 5 and 6)', TO_DATE('28-04-2025', 'DD-MM-YYYY'), TO_DATE('19-05-2025', 'DD-MM-YYYY'))
    RETURNING SPRINT_ID INTO v_sprint_id;

    --Employees--
    SELECT EMPLOYEE_ID INTO v_employee_1
    FROM TODOUSER.EMPLOYEE
    WHERE NAME = 'Angel E.';

    SELECT EMPLOYEE_ID INTO v_employee_2
    FROM TODOUSER.EMPLOYEE
    WHERE NAME = 'Victor J.';

    SELECT EMPLOYEE_ID INTO v_employee_3
    FROM TODOUSER.EMPLOYEE
    WHERE NAME = 'Karen C.';

    SELECT EMPLOYEE_ID INTO v_employee_4
    FROM TODOUSER.EMPLOYEE
    WHERE NAME = 'Carlos M.';

    SELECT EMPLOYEE_ID INTO v_employee_5
    FROM TODOUSER.EMPLOYEE
    WHERE NAME = 'Milan de A.';

    SELECT EMPLOYEE_ID INTO v_employee_6
    FROM TODOUSER.EMPLOYEE
    WHERE NAME = 'Valeria A.';

    ---TODOITEMS----
    
    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('Transform manager header into component', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-02 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Make the header of the manager visualization pages into a component', 2)
    RETURNING TODOITEM_ID INTO v_todoitem_1;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('Transform developer header into component', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Make the header of the developer visualization pages into a component', 2)
    RETURNING TODOITEM_ID INTO v_todoitem_2;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('Make carousel for selecting sprints', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-06 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Create the carousel for selecting history of sprints', 5)
    RETURNING TODOITEM_ID INTO v_todoitem_3;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('Create the button to redirect to carousel page', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-06 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Create a button in all manager pages to redirect to carousel selection page for sprint', 1)
    RETURNING TODOITEM_ID INTO v_todoitem_4;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('Make template for carousel', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-06 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Make a mock page (no backend connection) to select a different sprint', 4)
    RETURNING TODOITEM_ID INTO v_todoitem_5;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('New KPI Endpoint', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-02 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Create the endpoint of get % of overdue tasks by devId', 1)
    RETURNING TODOITEM_ID INTO v_todoitem_6;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('New KPI Endpoint', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-02 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Create the endpoint of get % of overdue tasks by devId and sprintId', 2)
    RETURNING TODOITEM_ID INTO v_todoitem_7;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('Login sprint info', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-02 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Make the telegram bot echo the info of the actual sprint when an authentication is made', 1)
    RETURNING TODOITEM_ID INTO v_todoitem_8;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('Change the endpoint of the telegram bot', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-02 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Make the telegram bot only return the tasks of the actual sprint', 1)
    RETURNING TODOITEM_ID INTO v_todoitem_9;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('Make better flow for task creation', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-02 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Make the telegram bot ask for all the needed information of a task', 2)
    RETURNING TODOITEM_ID INTO v_todoitem_10;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('Change flow of create task', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-09 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Make sure that there is the proper flow of task and subtask creation', 2)
    RETURNING TODOITEM_ID INTO v_todoitem_11;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('Connect Edit task endpoints', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-04-28 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-02 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Connect the endpoints of manager page to edit an existing task', 2)
    RETURNING TODOITEM_ID INTO v_todoitem_12;

    INSERT INTO TODOUSER.TODOITEM(NAME, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS)
    VALUES ('Connect carousel to backend', v_employee_1,
	   TO_TIMESTAMP_TZ('2025-05-06 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
	   TO_TIMESTAMP_TZ('2025-05-09 12:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
           v_sprint_id, 'Connect the endpoints of manager page to edit an existing task', 2)
    RETURNING TODOITEM_ID INTO v_todoitem_13;

	----Subtodoitems----
    INSERT INTO TODOUSER.SUBTODOITEM(TODOITEM_ID, SUBTODOITEM_ID) VALUES (v_todoitem_3, v_todoitem_4);
    INSERT INTO TODOUSER.SUBTODOITEM(TODOITEM_ID, SUBTODOITEM_ID) VALUES (v_todoitem_3, v_todoitem_5);
	
	----ASSIGNED DEV----
	--ASSIGN TO KAREN---
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_1, v_employee_3);
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_2, v_employee_3);
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_3, v_employee_3);
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_4, v_employee_3);
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_5, v_employee_3);

	--ASSIGN TO PANTAE--
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_6, v_employee_1);
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_7, v_employee_1);

	--ASSIGN TO VALE--
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_8, v_employee_6);
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_9, v_employee_6);
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_10, v_employee_6);

	--ASSIGN TO BETO--


    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_11, v_employee_4);
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_12, v_employee_4);
    INSERT INTO TODOUSER.ASSIGNEDDEV(TODOITEM_ID, EMPLOYEE_ID) VALUES (v_todoitem_13, v_employee_4);
END