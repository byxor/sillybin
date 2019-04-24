Number.prototype.mod = function(n) {
  return ((this % n) + n) % n;
}

function isEqual(positionA, positionB) {
    if (positionA === undefined || positionB === undefined) {
        return false;
    }
    return (positionA.x === positionB.x) && (positionA.y === positionB.y);
}

// Get a random integer between min (inclusive) and max (exclusive).
function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min;
}
