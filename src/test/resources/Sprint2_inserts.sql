DECLARE 
    v_sprint_id NUMBER;

    v_project_id NUMBER;
    
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
    v_todoitem_14 NUMBER;
    
    v_employee_1 NUMBER;
    v_employee_2 NUMBER;
    v_employee_3 NUMBER;
    v_employee_4 NUMBER;
    v_employee_5 NUMBER;
    v_employee_6 NUMBER;


    
BEGIN

    --Get project--

    SELECT PROJECT_ID INTO v_project_id
    FROM TODOUSER.PROJECT
    WHERE NAME = 'TEAM 11 Oracle Java';

    --Sprint--
    INSERT INTO TODOUSER.SPRINT(PROJECT_ID, NAME, START_DATE, END_DATE)
    VALUES(v_project_id, 'Sprint 2 (week 3 and 4)', TO_DATE('07-04-2025', 'DD-MM-YYYY'), TO_DATE('27-04-2025', 'DD-MM-YYYY'))
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

        -- 'COMPLETED' TODOITEMS --
    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, COMPLETION_TS, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('Frontend manager page toggle', 'COMPLETED', v_employee_1, 
       TO_TIMESTAMP_TZ('2025-04-18 13:13:36 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-09 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-19 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Create a toggle to switch from completed to pending tasks', 2)
    RETURNING TODOITEM_ID INTO v_todoitem_1;

    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, COMPLETION_TS, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('Frontend manager filter', 'COMPLETED', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-18 16:13:36 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-09 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-19 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Create filter to see tasks by specific developer', 2)
    RETURNING TODOITEM_ID INTO v_todoitem_2;

    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, COMPLETION_TS, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('Telegram KPI', 'COMPLETED', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-22 18:32:59 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-13 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-19 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Add functionality of KPI visualization for the Telegram Bot', 4)
    RETURNING TODOITEM_ID INTO v_todoitem_3;

    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, COMPLETION_TS, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('Prettify Frontend', 'COMPLETED', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-10 18:32:59 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-04 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-12 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Modify the elements of the frontend', 4)
    RETURNING TODOITEM_ID INTO v_todoitem_5;

    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, COMPLETION_TS, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('New endpoint 1', 'COMPLETED', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-12 10:38:59 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-04 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-12 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Create endpoint get pending tasks by devId and SprintId', 1)
    RETURNING TODOITEM_ID INTO v_todoitem_6;

    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, COMPLETION_TS, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('New endpoint 2', 'COMPLETED', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-18 11:13:36 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-04 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-12 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Create endpoint get completed tasks by devId and SprintId', 1)
    RETURNING TODOITEM_ID INTO v_todoitem_7;

    -- 'PENDING' TODOITEMS --
    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('New endpoint 3', 'PENDING', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-04 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-15 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Create endpoint to get worked hours by devId and sprintId', 1)
    RETURNING TODOITEM_ID INTO v_todoitem_8;

    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('New endpoint 4', 'PENDING', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-04 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-15 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Create endpoint to get worked hours by teamId and sprintId', 1)
    RETURNING TODOITEM_ID INTO v_todoitem_9;

    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('Frontend charts page 1', 'PENDING', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-13 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-19 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Create charts for the whole team by sprint', 4)
    RETURNING TODOITEM_ID INTO v_todoitem_10;

    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('Frontend charts page 2', 'PENDING', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-13 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-19 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Create charts for developer by sprint', 4)
    RETURNING TODOITEM_ID INTO v_todoitem_11;

    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('Frontend dev page', 'PENDING', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-09 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-19 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Create toggle to switch from completed to pending tasks', 2)
    RETURNING TODOITEM_ID INTO v_todoitem_12;

    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('Backend/frontend integration', 'PENDING', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-20 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-24 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Integrate the new frontend and the changes to the backend', 4)
    RETURNING TODOITEM_ID INTO v_todoitem_13;

    INSERT INTO TODOUSER.TODOITEM (NAME, STATUS, MANAGER_ID, START_DATE, DEADLINE, SPRINT_ID, DESCRIPTION, EST_HOURS) 
    VALUES ('Deploy', 'PENDING', v_employee_1, 
           TO_TIMESTAMP_TZ('2025-04-23 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           TO_TIMESTAMP_TZ('2025-04-24 00:00:00 -06:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM'), 
           v_sprint_id, 'Deploy the application in K8', 4)
    RETURNING TODOITEM_ID INTO v_todoitem_14;

    -- AssignedDev --
    --Victor--
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_2, v_todoitem_6);
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_2, v_todoitem_7);
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_2, v_todoitem_8);    
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_2, v_todoitem_9);
    --Karen--
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_3, v_todoitem_1);
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_3, v_todoitem_2);    
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_3, v_todoitem_5);
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_3, v_todoitem_12);
    --Beto--
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_4, v_todoitem_13);
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_4, v_todoitem_14);
    --Milan--
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_5, v_todoitem_10);
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_5, v_todoitem_11);
    --Vale--
    INSERT INTO TODOUSER.ASSIGNEDDEV(EMPLOYEE_ID, TODOITEM_ID) VALUES(v_employee_6, v_todoitem_3);


END;
