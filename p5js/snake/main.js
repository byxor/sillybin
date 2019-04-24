const SQUARE_SIZE = 10;

const BOARD = {
    size: {
        x: 40,
        y: 40,
    },
};

let snake;
let food;

function resetGame() {
    snake = createSnake();
    food = createFood(BOARD);
}

function setup() {
    createCanvas(400, 400);
    frameRate(4);

    resetGame();
}

function draw() {
    tick();

    background(0, 0, 0);
    drawSnake(snake);
    drawFood(food);
}

function tick() {
    snake = move(snake);

    if (isTouchingFood(snake, food)) {
        console.log("got food");
        snake = grow(snake);
        food = createFood(BOARD);
    }

    if (isOffBoard(BOARD, snake)) {
        resetGame();
        return;
    }

    if (isTouchingItself(snake)) {
        resetGame();
        return;
    }
}

function keyPressed() {
    if (key === 'j') {
        snake = turnLeft(snake);
    } else if (key === 'l') {
        snake = turnRight(snake);
    }
}

function drawSnake(snake) {
    fill(0, 255, 0);
    drawSquare(snake.head.position);

    fill(255, 255, 255);
    snake.bodyParts.forEach(bodyPart => {
        drawSquare(bodyPart.position);
    });
}

function drawFood(food) {
    fill(255, 0, 0);
    drawSquare(food.position);
}

function drawSquare(position) {
    rect(position.x * SQUARE_SIZE,
         position.y * SQUARE_SIZE,
         SQUARE_SIZE,
         SQUARE_SIZE);
}
