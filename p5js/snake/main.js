const SQUARE_SIZE = 20;

let board;
let snake;
let food;

function resetGame() {
    board = createBoard();
    food = createFood(board);
    snake = createSnake();
}

function setup() {
    resetGame();

    createCanvas(board.size.x * SQUARE_SIZE,
                 board.size.y * SQUARE_SIZE);
    frameRate(4);
}

function draw() {
    tick();

    background(0, 0, 0);
    drawSnake(snake);
    drawFood(food);
}

function tick() {
    console.log(snake);

    snake = move(snake);

    if (isTouchingFood(snake, food)) {
        snake = grow(snake);
        food = createFood(board);
    }

    if (isOffBoard(board, snake)) {
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
