#lang racket

; 1
(define (y-intercept m b)
  b)

; Tests 
(display "(y-intercept 2 7) -> 7: ")
(y-intercept 2 7)

(display "(y-intercept 2 0) -> 0: ")
(y-intercept 2 0)

(display "(y-intercept 0 -2) -> -2: ")
(y-intercept 0 -2)



; 2
(define (x-intercept m b)
  (- 0 (/ b m)))

; Tests
(display "(x-intercept 2 8) -> -4: ")
(x-intercept 2 8)

(display "(x-intercept -1 4) -> 4: ")
(x-intercept -1 4)

(display "(x-intercept 2 0) -> 0: ")
(x-intercept 2 0)

(displayln "(x-intercept 0 3) -> null: ")
;(x-intercept 0 3)

(displayln "(x-intercept 0 0) -> null: ")
;(x-intercept 0 0)



; 3
(define (triangle-area m b)
 (abs (* 1/2 (y-intercept m b) (x-intercept m b))))

; Tests 
(display "(triangle-area 1 4) -> 8: ")
(triangle-area 1 4)

(display "(triangle-area 4 -8) -> 8: ")
(triangle-area 4 -8)

(display "(triangle-area -4 -8) -> 8: ")
(triangle-area -4 -8)

(display "(triangle-area 2 0) -> 0: ")
(triangle-area 2 0)

(displayln "(triangle-area 0 -2) -> null: ")
;(triangle-area 0 -2)



; 4
(define (modadd low high current addnum)
  (define number-count (+ (- high low) 1))
   (+ (modulo(+ addnum (- current low)) number-count) low))

; Tests 
(display "(modadd 4 7 5 0) -> 5: ")
(modadd 4 7 5 0)

(display "(modadd -2 1 0 3) -> -1: ")
(modadd -2 1 0 3)

(display "(modadd 4 7 5 1) -> 6: ")
(modadd 4 7 5 1)

(display "(modadd 4 7 5 2) -> 7: ")
(modadd 4 7 5 2)

(display "(modadd 4 7 5 3) -> 4: ")
(modadd 4 7 5 3)

(display "(modadd 5 5 5 1) -> 5: ")
(modadd 5 5 5 1)

(display "(modadd 0 9 5 100) -> 5: ")
(modadd 0 9 5 100)

; 5
(define (modsub low high current subnum)
   (modadd low high current (- 0 subnum)))

; Tests
(display "(modsub 4 7 5 0) -> 5: ")
(modsub 4 7 5 0)

(display "(modsub -2 1 0 3) -> 1: ")
(modsub -2 1 0 3)

(display "(modsub 4 7 5 1) -> 4: ")
(modsub 4 7 5 1)

(display "(modsub 4 7 5 3) -> 4: ")
(modadd 4 7 5 3)



; 6
(define (addtime time mins)
   (define start-hour
     (truncate (/ time 100)))
  (define start-mins
    (- time (* start-hour 100)))
  (define new-hour
    (truncate (/ (+ start-mins mins) 60)))
  (define new-mins
    (- (+ mins start-mins) (* new-hour 60)))
  (+ (* (modadd 1 12 start-hour new-hour) 100) new-mins))

; Tests
(display "(addtime 1230 1)) -> 1231: ")
(addtime 1230 1)

(display "(addtime 1230 29)) -> 1259: ")
(addtime 1230 29)

(display "(addtime 1230 30) -> 100: ")
(addtime 1230 30)

(display "(addtime 1230 525600)) -> 1230: ")
(addtime 1230 525600)

(display "(addtime 1230 200) -> 350: ")
(addtime 1230 200)



