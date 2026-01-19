const request =  require('supertest')
const server =  require('../src/index')
const app = request(server)
describe('GET /api/welcome', () => {
    it('welcome message', async () => {
        const res =  await app
            .get('/api/welcome')
            .expect('Content-Type', 'application/json; charset=utf-8')
            .expect('{"message":"Welcome to Traffic-Light!","status":"success"}')
            .then((res) => {
                expect(res.statusCode).toBe(200);
            })
    })
})
 
describe("GET /api/trafficlight", () => {
    it('should return OUT OF ORDER for undefined', async () => {
        const res = await app
            .get('/api/trafficlight')
            .expect('Content-Type', 'application/json; charset=utf-8')
            .expect(200)
            .then((res) => {
                expect(res.body.message).toBe('OUT OF ORDER');
                expect(res.body.status).toBe('success');
            })
    })
})
 
describe("GET /api/trafficlight/:color", () => {
    it.each([
        ['red', `{"message":"DON'T WALK!","status":"success"}`],
        ['orange', `{"message":"ATTENTION!","status":"success"}`],
        ['green', `{"message":"WALK!","status":"success"}`],
        ['', `{"message":"OUT OF ORDER","status":"success"}`]
    ])('When color is %s then "%s"', async (color, shouldBe) => {
        const res = await app
            .get(`/api/trafficlight/${color}`)
            .expect('Content-Type', 'application/json; charset=utf-8')
            .expect(shouldBe)
            .then((res) => {
                expect(res.statusCode).toBe(200);
            })
        })
})
 
afterAll(async () => {
    server.close();
});