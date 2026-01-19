const app = require('../src/trafficlight');

describe('test suite traffic light undefined', () => {
    it.each([
        [undefined, "OUT OF ORDER"],
        [null, "OUT OF ORDER"],
        ['', "OUT OF ORDER"]
    ])("When color is %s then message is %s", (color, expectedMessage) => {
        expect(app.trafficLight(color)).toBe(expectedMessage);
    });
});

describe('test suite traffic light with colors', () => {
    it.each([
        ['red', `DON'T WALK!`],
        ['orange', 'ATTENTION!'],
        ['green', 'WALK!']
    ])('case %s light', (color, expectedMessage) => {
        expect(app.trafficLight(color)).toBe(expectedMessage);
    });

    test('case invalid color', () => {
        expect(app.trafficLight('blue')).toBeUndefined();
    });
});
