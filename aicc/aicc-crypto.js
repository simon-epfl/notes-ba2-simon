const alphabet = [
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
];

const letterIndex = (letter) => {
    return alphabet.indexOf(letter);
}

// for instance K : 10
// i : 8
// I want (10 + D) % 26 = 8
const computeD = (letterA, letterB) => {
    const shift = letterIndex(letterB) - letterIndex(letterA); // between -25 and 25
    return shift < 0 ? shift + 26 : shift;
}

const fromIndex = (index) => {
    return alphabet[index];
}

console.log(letterIndex('g'))
console.log(computeD('k', 'g'))
console.log(fromIndex(11))
