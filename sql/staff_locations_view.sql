-- Task 7: Create a view for staff locations (excludes CEO and CFO)
-- Used by the external payroll company

CREATE VIEW staff_locations_view AS
SELECT staff.staff_id,
       staff.first_name,
       staff.last_name,
       staff.location
FROM staff
WHERE "position" NOT IN ('CEO', 'CFO');
