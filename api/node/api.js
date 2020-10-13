import Koa from 'koa';
import Router from 'koa-router';

var app = new Koa();
var router = new Router();

router.get('/hello/:name?', (ctx) => {
    const name = ctx.params.name || 'World';
    ctx.body = `Hello there ${name}!`;
});

app
    .use(router.routes())
    .use(router.allowedMethods());

app.listen(3000);