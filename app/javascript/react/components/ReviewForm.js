import React from 'react';

const ReviewForm = (props) => {
  let valueRange = ['20', '40', '60', '80', '100']
  let buttons = valueRange.map((value)=>{
    return(
      <label>Lvl {value/20}
        <RadioButton
          id="radio"
          passDownRatingChange={props.passDownRatingChange}
          value={value}
          rating={props.rating}
          key={value}
        />
      </label>
    )
  })
  return(
    <div>
      <form id="form">
        <h4>Review Form</h4>

        <label>
          <input
            type="text"
            name="reviewForm"
            id="reviewForm"
            value={props.bodyText}
            onChange={props.passDownReviewChange}
          />
        </label>
        <div  id="radio" className="radio">
        {buttons}
        </div>
        <div className="button-group">
          <button onClick={props.passDownSubmit}>Submit Review</button>
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
