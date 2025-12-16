#!/usr/bin/env racket
#lang sicp

; division files will be represented as a pair with a type-tag that is 
; the name of the division, and then the employee records as its
; contents

; each division should have a get-record procedure that when given
; an employee name returns their record, if it exists
(define (get-record employee personnel)
  (let ((proc (get 'get-record (type-tag personnel))))
    (if proc
        (apply div-spec (list employee (contents personnel)))
        (error
          "Unable to access division personnel file: GET-RECORD"
          personnel))))
; the type-tag of personnel is the name of the division
; the contents of personnel is the division-specific data structure
; that is used to store the employee data
; get-record traverses that specific data structure to find the
; record for the given employee name

; get-salary is a procedure that is specific to the set representation
; used by a specific division 
; it first finds the employee record and then uses the division type
; to apply the right get-salary procedure to the record it already found
(define (get-salary employee personnel)
  (let ((record (get-record employee personnel)))
    (let ((proc (get 'get-salary (type-tag personnel))))
      (if proc
        (apply proc (list employee record))
        (error
          "Unable to access employee file: GET-SALARY"
          personnel))))

(define (find-employee-record employee files)
  (if (null? files)
      (error
        "Employee not in any division file: FIND-EMPLOYEE-RECORD"
        employee)
      (let ((record (get-record employee (car files))))
        (if record
            record
            (find-employee-record employee (cdr files))))))

; when taking over new company, the division must provide a
; get-record procedure that fetches a given employee's record from
; the particular data structure used to store them
; as well as procedures to fetch information from the particular
; set representation of a particular employee's record
; these procedures will be installed using the put procedure into
; the dispatch table, keyed on operation name, like "get-record"
; and division name (as the type-tag)
; lastly, when providing the personnel file, it must be tagged with
; the name of the division
