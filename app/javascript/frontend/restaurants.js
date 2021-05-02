import axios from 'axios'

document.addEventListener('DOMContentLoaded', function() {
	let thumbsUp = document.querySelector('#thumb')

	if (thumbsUp) {
		let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token

		thumbsUp.addEventListener('click', function(e) {
      let btn = e.target
      let id = btn.dataset['id']

			ax.post(`/restaurants/${id}/pocket_list`) //promise
			.then( function(response) {
        if (response.data.status === 'added') {
          btn.classList.add('thumbs-color') //加入口袋就上色
        } else {
          btn.classList.remove('thumbs-color') //拿出口袋就刪掉
        }
      })
			.catch( function(error) {
        console.log(error)
      })
      
		})
	}
	
})

