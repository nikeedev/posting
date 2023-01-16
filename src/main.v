module main

import net.http
import json
import time

struct User {
	username  string
	password  string
}

const (
	user = User{username: "___22___", password: "___11___"}
)

fn main() {
	mut conf := http.FetchConfig{
		url: 'https://scratch.mit.edu/login/'
		data: json.encode(user)
		method: .post
	}

	conf.header.add_custom('X-Requested-With', 'XMLHttpRequest') !
    conf.header.add_custom('X-CSRFToken', 'a') !
	conf.header.add_custom('Referer', 'https://scratch.mit.edu') !
	conf.header.add_custom('Cookie', 'scratchcsrftoken=a;') !
	conf.header.add_custom('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36') !
	conf.header.add_custom('content_type', 'application/json') !

	mut response := http.fetch(conf) !

	// time.sleep(1500)

	println(response.header.get_custom('scratchsessionid', exact: true)!)

}
