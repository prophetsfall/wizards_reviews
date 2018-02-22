import React from 'react';

const ReviewTile = props => {
  let body = props.body
  let rating =[]
  for (let i = 0; i < props.rating/20; i++){
    rating.push(
        <i key={i} className="fas fa-star clickedStar"></i>
    )
  }
  let created_at = props.created_at
  let votes = props.votes
  let handleClick = (event) => {
    let clicked = event.currentTarget
    let formPayload;
    if (clicked.className === 'upvote') {
      formPayload = {
        vote: {
          vote: 1,
          review_id: props.id
        }
      }
    } else if (clicked.className === 'downvote') {
      formPayload = {
        vote: {
          vote: -1,
          review_id: props.id
        }
      }
    }
    props.alterVote(formPayload)
  }

  return(
    <div className='reviewTile'>
    <div className='row'>
      <div className='small-1 columns'><br /></div>
      <div className="small-1 columns">
        <a className="downvote" onClick={handleClick}>
          <i className="fas fa-arrow-down" ></i>
        </a> {votes} <a className="upvote" onClick={handleClick}>
          <i className="fas fa-arrow-up" ></i>
        </a>
      </div>
      <div className='small-10 columns'>
        <div className="row">
          <div className="small-12 columns small-centered"> {body}</div>
        </div>
        <div className='row'>
          <div className='small-12 columns small-centered'> {rating}</div>
        </div>
      </div>
    </div>
  </div>
  )
}
export default ReviewTile;
