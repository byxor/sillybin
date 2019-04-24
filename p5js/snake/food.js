function createFood(board) {
    return {
        position: {
            x: getRandomInt(0, board.size.x),
            y: getRandomInt(0, board.size.y),
        }
    }
}
