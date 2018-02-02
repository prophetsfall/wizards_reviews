import React from 'react';

const ReviewForm = (props) => {
  let valueRange = ['20', '40', '60', '80', '100']
  let buttons = valueRange.map((value)=>{
    return(
      <label key={value}>{value/20}
        <RadioButton
          id="radio"
          passDownRatingChange={props.passDownRatingChange}
          value={value}
          rating={props.rating}
        />
      </label>
    )
  })
  return(
    <div>
      <form id="form">
        <label id="label">Review Form
          <input
            type="text"
            name="reviewForm"
            value={props.bodyText}
            onChange={props.passDownReviewChange}
          />
        </label>
        <div  id="radio" className="radio">
        {buttons}
        </div>
        <div className="button-group">
          <button id="submitReviewButton" onClick={props.passDownSubmit}>Submit Review</button>
          <button id="deleteReviewButton" onClick={props.passDownDelete}>Delete Review</button>
        </div>
      </form>
    </div>
  )
  }

  const RadioButton = (props) => {
    return(
      <div>
        <input name="rating" type="radio"     value={props.value}
          checked={props.rating===props.value}
          onChange={props.passDownRatingChange}
        />
      </div>

    )
  }
export default ReviewForm;
