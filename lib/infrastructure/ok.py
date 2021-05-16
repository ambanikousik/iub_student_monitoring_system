# Number of PLOs achieved by students
def getNoOfPLOAchieved(student_id):
    number = 0
    with connection.cursor() as cursor:
        cursor.execute('''
            SELECT COUNT(TotalPlo.PLOpercentage) AS Acheive
            FROM (
                    SELECT   student_id,(PLO / TotalComark * 100) AS PLOpercentage
                    FROM mainapp_plo_t p,
                        mainapp_co_t co,
                        (
                            SELECT en.student_id,c.plo_id,SUM(DISTINCT e.obtainedMarks) AS PLO,SUM(DISTINCT a.marks)AS TotalCoMark
                            FROM mainapp_enrollment_t en,
                                mainapp_evaluation_t e,
                                mainapp_assessment_t a,
                                mainapp_co_t c,
                                mainapp_plo_t p,
                                mainapp_section_t sec
                            WHERE en.student_id = '{}'
                            AND en.enrollmentID = e.enrollment_id
                                AND e.assessment_id = a.assessmentNo
                                AND a.co_id = c.id
                                AND c.plo_id = p.ploNo
                            GROUP BY  student_id,p.ploNo
                        ) ploPer
                    WHERE p.ploNo = ploPer.plo_id

                GROUP BY student_id,ploNo
                HAVING PLOpercentage >=40
                ) TotalPlo

            GROUP BY student_id
        '''.format(student_id))
        number = cursor.fetchone()[0]
        if number is None:
            number = 0
            
    return number
    
# PLO Attempted
def getNoOfPLOAttempted(student_id):
    number = 0
    with connection.cursor() as cursor:
        cursor.execute('''
            SELECT COUNT(TotalPlo.PLOpercentage) AS Acheive
            FROM (
                    SELECT   student_id,(PLO / TotalComark * 100) AS PLOpercentage
                    FROM mainapp_plo_t p,
                        mainapp_co_t co,
                        (
                            SELECT en.student_id,c.plo_id,SUM(DISTINCT e.obtainedMarks) AS PLO,SUM(DISTINCT a.marks)AS TotalCoMark
                            FROM mainapp_enrollment_t en,
                                mainapp_evaluation_t e,
                                mainapp_assessment_t a,
                                mainapp_co_t c,
                                mainapp_plo_t p,
                                mainapp_section_t sec
                            WHERE en.student_id = '{}'
                            AND en.enrollmentID = e.enrollment_id
                                AND e.assessment_id = a.assessmentNo
                                AND a.co_id = c.id
                                AND c.plo_id = p.ploNo
                            GROUP BY  student_id,p.ploNo
                        ) ploPer
                    WHERE p.ploNo = ploPer.plo_id

                GROUP BY student_id,ploNo
            
                ) TotalPlo
        '''.format(student_id))
        number = cursor.fetchone()[0]
        if number is None:
            number = 0
            
    return number
    

# min lowest PLO %
def getMinLowestPLO(student_id):
    number = 1000000
    plo = ''
    for i in range(12):
        ploNum = f'PLO0{i + 1}'
        if i + 1 >= 10:
            ploNum = f'PLO{i + 1}'
        with connection.cursor() as cursor:
            cursor.execute('''
                SELECT AVG(TotalPlo.PLOpercentage) AS ActualPlo
                FROM (
                SELECT (PLO / TotalComark * 100) AS PLOpercentage
                FROM (
                        SELECT SUM(DISTINCT e.obtainedMarks) AS PLO, SUM(DISTINCT a.marks) AS TotalCoMark
                        FROM mainapp_enrollment_t en,
                            mainapp_evaluation_t e,
                            mainapp_assessment_t a,
                            mainapp_co_t c,
                            mainapp_plo_t p
                        WHERE en.student_id = '{}'
                            AND en.enrollmentID = e.enrollment_id
                            AND e.assessment_id = a.assessmentNo
                            AND a.co_id = c.id
                            AND c.plo_id = '{}'
                        GROUP BY en.section_id
                    ) ploPer
                ) TotalPlo;
            '''.format(student_id, ploNum))
            temp = cursor.fetchone()
            if temp is not None:
                if number > temp[0]:
                    number = temp[0]
                    plo = ploNum
                    
    return plo

# PLO Success Rate
def ploSuccessRate(student_id):
    return np.round(getNoOfPLOAchieved(student_id) / getNoOfPLOAttempted(student_id) * 100, 1)

