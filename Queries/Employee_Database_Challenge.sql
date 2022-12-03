-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

--Count number of retiring titles
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC

--Mentorship Eligibility Table
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no) 
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no; 




--Count number of mentorship eligibitity
SELECT COUNT (title), title
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT DESC


--Count number of retiring titles
SELECT COUNT (title)
FROM unique_titles

--Count number of employees
SELECT COUNT (to_date = '9999-01-01')
FROM dept_emp

--Count total number of mentorship eligibility requirement
SELECT COUNT (title)
FROM mentorship_eligibility