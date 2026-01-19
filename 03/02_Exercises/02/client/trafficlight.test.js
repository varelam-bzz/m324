//require supertest
const request = require('supertest');
//url of localserver is assigned to app
const app = 'http://localhost:3000';

describe("GET /api/welcome", () => {
    it("welcome message", async () => {
        const response = await request(app)
            .get('/api/welcome')
            .expect(200)
            .expect('Content-Type', /json/);

        expect(response.body).toHaveProperty('message');
        expect(response.body.message).toBe('Welcome to the traffic light API');
    });
});

describe("GET /api/trafficlight", () => {
    it("out of order", async () => {
        const response = await request(app)
            .get('/api/trafficlight')
            .expect(200)
            //be aware of empty spaces
            .expect('Content-Type', /json/);

        expect(response.body).toHaveProperty('message');
        expect(response.body.message).toBe('OUT OF ORDER');
    });
});

describe("GET /api/trafficlight/:color", () => {
    it("red", async () => {
        const response = await request(app)
            .get('/api/trafficlight/red')
            .expect(200)
            .expect('Content-Type', /json/);

        expect(response.body).toHaveProperty('message');
        expect(response.body.message).toBe("DON'T WALK!");
    });

    it("green", async () => {
        const response = await request(app)
            .get('/api/trafficlight/green')
            .expect(200)
            .expect('Content-Type', /json/);

        expect(response.body).toHaveProperty('message');
        expect(response.body.message).toBe('WALK!');
    });

    it("orange", async () => {
        const response = await request(app)
            .get('/api/trafficlight/orange')
            .expect(200)
            .expect('Content-Type', /json/);

        expect(response.body).toHaveProperty('message');
        expect(response.body.message).toBe('ATTENTION!');
    });
});

