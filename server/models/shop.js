var mongoose = require('mongoose');
var Schema = mongoose.Schema;

/*
http://192.168.99.100:4000/api/shop
{
	"title": "서비스 운영이 쉬워지는 AWS 인프라 구축 가이드",
	"intro": "이 책은 AWS나 클라우드 환경에 익숙하지 않은 분들이 AWS 서비스를 잘 활용해 실전에서 바로 서비스를 운영할 수 있게 도와준다. 기초적인 서버 구성 방법부터 배포, 모니터링, CI/CD 같은 고도화 등 운영 서버 관리에 필요한 모든 영역을 다룬다. 이론에만 머무르는 것이 아니라 실무에서 바로 서비스를 운영할 수 있도록 30개 가량의 실습이 포함돼 있으며, 환경 구성은 물론 다양한 서비스 사용 시 발생하는 예외 상황에 바로 대처할 수 있게 돕는다.",
	"isbn13":"9791158391317",
	"isbn10":"1158391315",
	"price": 24300,
	"publishDt": "2019-01",
	"publisher": "위키북스",
	"author": "김당형",
	"thumbnail": "http://image.yes24.com/goods/68799454/L"
}
*/
var shopSchema = new Schema({
    intro: String,
    title: String,
    price : Number,
    isbn13: String,
    isbn10: String,
    publisher: String,
    publishDt: String,
    author: String,
    thumbnail: String,
    createdDate: { type: Date, default: Date.now  }
});

module.exports = mongoose.model('shop', shopSchema);
