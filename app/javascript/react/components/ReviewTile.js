import React from 'react';


const ReviewTile = props => {

  let body = props.body
  let rating = props.rating
  let created_at = props.created_at

  return(
    <div>
      <p> {body}</p>
      <p> {rating}</p>
    </div>
  )
}
export default ReviewTile;
