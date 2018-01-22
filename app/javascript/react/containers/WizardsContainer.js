import React, { Component } from 'react';

class WizardsContainer extends Component {
  constructor(props){
    super(props);
    this.state={
      wizards: []

    }
    componentDidMount() {

    // FETCH ARTICLE BY ID
    fetch(`api/v1/index`)
    .then(response => response.json())
    .then(json => {

      this.setState({ wizards: json})
    })
  }

    }
  }
  render(){

  }
}
