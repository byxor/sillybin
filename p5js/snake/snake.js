const UP = 0;
const RIGHT = 1;
const DOWN = 2;
const LEFT = 3;

const DIRECTIONS = {
    [UP]:    {x: +0, y: -1},
    [DOWN]:  {x: +0, y: +1},
    [LEFT]:  {x: -1, y: +0},
    [RIGHT]: {x: +1, y: +0},
};

const NUMBER_OF_DIRECTIONS = 4;

function createSnake() {
    return {
        direction: RIGHT,

        head: {
            position: {
                x: 2,
                y: 1,
            },
        },

        bodyParts: [],
    };
}

function move(snake) {
    const velocity = DIRECTIONS[snake.direction];

    const oldHead = snake.head;
    const newHead = {
        position: {
            x: oldHead.position.x + velocity.x,
            y: oldHead.position.y + velocity.y,
        },
    };

    const oldTail = snake.bodyParts.shift();

    snake.head = newHead;
    snake.bodyParts.push(oldHead);

    return snake;
}

function turnLeft(snake) {
    snake.direction = (snake.direction - 1).mod(NUMBER_OF_DIRECTIONS);
    return snake;
}

function turnRight(snake) {
    snake.direction = (snake.direction + 1).mod(NUMBER_OF_DIRECTIONS);
    return snake;
}

function isOffBoard(board, snake) {
    if (snake.head.position.x < 0) {
        return true;
    }

    if (snake.head.position.y < 0) {
        return true;
    }

    if (snake.head.position.x >= board.size.x) {
        return true;
    }

    if (snake.head.position.y >= board.size.y) {
        return true;
    }

    return false;
}

function isTouchingItself(snake) {
    for (let bodyPart of snake.bodyParts) {
        console.log(bodyPart.position, snake.head.position);
        if (isEqual(bodyPart.position, snake.head.position)) {
            return true;
        }
    }
    return false;
}

function isTouchingFood(snake, food) {
    return isEqual(snake.head.position, food.position);
}

function grow(snake) {
    const tail = snake.bodyParts[0];
    snake.bodyParts.unshift(tail);
    return snake;
}
