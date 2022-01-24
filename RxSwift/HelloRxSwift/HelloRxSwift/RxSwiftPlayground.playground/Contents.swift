import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let strikes = PublishSubject<String>()
let disposeBag = DisposeBag()


/* scan
let source = Observable.of(1,2,3,5,6)

source.scan(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
 */

/* Reduce
let source = Observable.of(1,2,3)

source.reduce(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
 */

/* With Latest form
let button = PublishSubject<Void>()
let textField = PublishSubject<String>()

let observable = button.withLatestFrom(textField)
let disposable = observable.subscribe(onNext: {
    print($0)
})
let a = "ffdfdf"
textField.onNext("Swif")
textField.onNext("Swift")
textField.onNext("Swift Rocks!")

button.onNext(())
button.onNext(())
*/
/* combineLatest
let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let observable = Observable.combineLatest(left, right, resultSelector:{
    lastLeft, lastRight in
    "\(lastLeft) \(lastRight)"
})

let disposable = observable.subscribe(onNext: { value in
    print(value)
})

left.onNext(45)
right.onNext(1)
left.onNext(30)
right.onNext(99)
right.onNext(2)
 */

/* merge
let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let source = Observable.of(left.asObservable(), right.asObservable())

let observable = source.merge()
observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

left.onNext(5)
left.onNext(3)
right.onNext(2)
right.onNext(1)
left.onNext(99)
*/

/* concat
let first = Observable.of(1,2,3)
let second = Observable.of(4,5,6)

let observable = Observable.concat([first, second])

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
 */


/* startWith

let numbers = Observable.of(2,3,4)

let observable = numbers.startWith(1)
observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
*/
 
 
/* flatMapLatest
struct Student {
    var score: BehaviorRelay<Int>
}

let john = Student(score: BehaviorRelay(value: 75))
let mary = Student(score: BehaviorRelay(value: 95))

let student = PublishSubject<Student>()

student.asObservable()
    .flatMapLatest {$0.score.asObservable()}
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

student.onNext(john)
john.score.accept(100)

student.onNext(mary)
mary.score.accept(80)

john.score.accept(43)
 */

/* map
Observable.of(1,2,3,4,5)
    .map {
        return $0 * 2
    }.subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
 */
 
/* toArray
Observable.of(1,2,3,4,5)
    .toArray()
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
 */

/* // ignoreElement
strikes
    .ignoreElements()
    .subscribe { _ in
        print("[Subscription is called]")
    }.disposed(by: disposeBag)

strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")

strikes.onCompleted() // ignoreElement로 A, B, C가 나타나지 않고, oncompleted 되었을 때 print가 실행됨

*/

/* // elemantAt
strikes.elementAt(2)
    .subscribe(onNext: { _ in
        print("You are out!")
    }).disposed(by: disposeBag)

strikes.onNext("X")
strikes.onNext("Y")
strikes.onNext("Z")
*/

/* filter
Observable.of(1,2,3,4,5,6,7)
    .filter { $0 % 2 == 0 }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
 */
/* skip
Observable.of("A", "B", "C", "D", "E", "F")
    .skip(3)
    .subscribe(onNext : {
        print($0)
    }).disposed(by: disposeBag)

 */

/* skipWhile
Observable.of(2,2,3,4,4)
    .skipWhile { $0 % 2 == 0 } // 순서대로 반복하다가 조건이 만족하지 않는 경우에는 skip이 stop된다
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
  
 */

/* skipUntil
let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.skipUntil(trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

subject.onNext("A")
subject.onNext("B")
trigger.onNext("X") // trigger 이후의 것들만 출력된다
subject.onNext("C")
 */

/* take
Observable.of(1,2,3,4,5,6)
    .take(3)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
 */
/* takeWhile
Observable.of(2,4,6,7,8,10)
    .takeWhile { // 조건이 false이면 그때부터 리턴하지 않는다
        return $0 % 2 == 0
    }.subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
 */

/* takeUntil
let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.takeUntil(trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

subject.onNext("1")
subject.onNext("2")

trigger.onNext("X") // 트리거가 동작하기 전까지만 동작

subject.onNext("3")
 */




/*
 // 옵저버블이란 이벤트를 구독하고 획득할 수 있다는 것이다
let observable = Observable.just(1)

let observable2 = Observable.of(1,2,3)

let observable3 = Observable.of([1,2,3])

let observable4 = Observable.from([1,2,3,4,5])

// from은 array로부터 하나씩 가져오고, of는 ,를 기준으로 하나씩 가져온다. array가 들어올 경우 전체를 가져온다
observable4.subscribe { event in
    if let element = event.element {
        print(element)
    }
    
}
print("-----------------------")

observable3.subscribe { event in
    if let element = event.element {
        print(element)
    }
    
}
print("-----------------------")

observable2.subscribe { event in
    if let element = event.element {
        print(element)
    }
}
print("-----------------------")

let subscription4 = observable4.subscribe(onNext: { element in
    print(element)
})

subscription4.dispose()
// 옵저버는 observable을 계속해서 구독하기 때문에 memory leak가 발생할 수 있다
// 따라서 완료 후에는 dispose 해주어야 한다
*/

/*
// DisposeBag은 dispose할 객체들을 담는 가방이다
// 여러가지 Observable객체들을 이 가방에 담아서 dispose할 수 있다
let disposeBag = DisposeBag()

Observable.of("A", "B", "C")
    .subscribe {
        print($0)
    }.disposed(by: disposeBag)

Observable<String>.create { observer in
    
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?") // 밑에서 oncompleted가 실행된 이후 onDisposed가 실행되므로 이부분은 실행 안됨
    return Disposables.create()
}.subscribe(onNext:{ print($0) } , onError: { print($0) }, onCompleted: { print("Completed") }, onDisposed: { print("Disposed")})
    .disposed(by: disposeBag)
*/
/*
let disposeBag = DisposeBag()

let subject = PublishSubject<String>()

subject.onNext("Issue 1")

subject.subscribe { event in
    print(event)
    
}
// Issue 1은 subscribe 이전의 이벤트라 실행되지 않고, Issue 2는 subscribe 이후의 이벤트라서 출력된다
subject.onNext("Issue 2")
subject.onNext("Issue 3")

//subject.dispose()

subject.onCompleted()

// dispose 되거나 completed된 이후 Issue 4는 무시된다
subject.onNext("Issue 4")
*/
/*
let disposeBag = DisposeBag()

// BehaviorSubject는 초기값을 가짐(초기값을 설정해주거나 마지막 onNext)
let subject = BehaviorSubject(value: "Initial Value")

// subject는 데이터를 방출(emit)하고 읽을(subscribe) 수 있다
// 여기서는 Last Issue라는 String을 방출한 것이다
subject.onNext("Last Issue")

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 1")
*/
/*
let disposeBag = DisposeBag()

let subject = ReplaySubject<String>.create(bufferSize: 2)

subject.onNext("Issue 1")
subject.onNext("Issue 2")
subject.onNext("Issue 3")

subject.subscribe {
    print($0)
}

subject.onNext("Issue 4")
subject.onNext("Issue 5")
subject.onNext("Issue 6")

print("[Subscription 2]")

subject.subscribe {
    print($0)
}
*/
/*
let disposeBag = DisposeBag()

let variable = Variable([String]())

variable.value.append("Item 1")

variable.asObservable()
    .subscribe {
        print($0)
    }

variable.value.append("Item 2")
*/

/*
let disposeBag = DisposeBag()
// BehaviorRelay를 사용하기 위해서는 Rxcocoa import해야함
let relay = BehaviorRelay(value: ["Item 1"])

// 값 추가 -> Initial value 삭제됨
//relay.accept(["Item 2"])

// 값 추가 -> Initial value 삭제 안됨
relay.accept(relay.value + ["Item 2"])

var value = relay.value
value.append("Item 2")
value.append("Item 3")

relay.accept(value)

relay.asObservable()
    .subscribe {
        print($0)
    }
*/





