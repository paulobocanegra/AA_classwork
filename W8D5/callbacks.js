class Clock {
    constructor() {
        // 1. Create a Date object.
        // 2. Store the hours, minutes, and seconds.
        // 3. Call printTime.
        // 4. Schedule the tick at 1 second intervals.

        const date = new Date();
        this.hours = date.getHours();
        this.minutes = date.getMinutes();
        this.seconds = date.getSeconds();
        this.printTime();
        setInterval(()=>{ this._tick() }, 1000);
    }

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.
        console.log(`${this.hours}:${this.minutes}:${this.seconds}`)
    }

    _tick() {
        // 1. Increment the time by one second.
        // 2. Call printTime.
        this.seconds += 1;
        if (this.seconds === 60){
            this.seconds = 0;
            this.minutes += 1;
            if (this.minutes === 60){
                this.minutes = 0;
                this.hours += 1;
                if (this.hours === 24){
                    this.hours = 0;
                }
            } 
        }
        this.printTime();
    }
}

const { debug } = require('console');
// const clock = new Clock();

const readline = require('readline');

// const reader = readline.createInterface({
//     input: process.stdin, 
//     output: process.stdout
// });

addNumbers = function(sum, numsLeft, completionCallbacks) {
    // debugger
    if (numsLeft === 0){
        return completionCallbacks(sum);
    };
        if (numsLeft > 0) {
            reader.question('Insert a number: ', function(input){
                sum += parseInt(input); 
                numsLeft -= 1;    
                return addNumbers(sum, numsLeft, completionCallbacks);
            });
        };
}


// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));


const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function askIfGreaterThan(el1, el2, callback){

    reader.question(`Is ${el1} > ${el2}? `, function(input){
        if ('yes') {
            return callback(true);
        }  else if ('no') {
            return  callback(false);
        }   else {
            console.log("Did I stutter? I said yes OR no!")
        }
    })
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop){
    if (i === arr.length - 1){
        console.log(arr)
        return outerBubbleSortLoop();
    } else {
        return askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan){
           if (isGreaterThan) {
               [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
                madeAnySwaps = true;
            } else {
               madeAnySwaps = false;
            }; 
            innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop)
        });
    }
}

// askIfGreaterThan(1,5, logs => console.log(`${logs}`))

// function outerBubbleSortLoop(madeAnySwaps){
//     console.log("In outer bubble sort");
//     reader.close();
// }

function absurdBubbleSort(arr, sortCompletionCallback){
    function outerBubbleSortLoop(madeAnySwaps){
        // debugger
        if (madeAnySwaps) {
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        } else {
            return s  vcortCompletionCallback(arr);
        }
    }
    // debugger
    outerBubbleSortLoop(true)
};

// absurdBubbleSort([3, 2, 1], function (arr) {
//     console.log("Sorted array: " + JSON.stringify(arr));
//     reader.close();
// });


absurdBubbleSort([1, 2, 3], function (arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
});


// innerBubbleSortLoop([6,3], 0, false, outerBubbleSortLoop)