import WizardsContainer from '../../app/javascript/react/containers/WizardsContainer'
import WizardTile from '../../app/javascript/react/components/WizardTile'

import { shallow, mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';
import 'jasmine-ajax';

import fetch from 'isomorphic-fetch'

Object.assign(global, {
  jasmineEnzyme,
  mount,
  React,
  shallow,
});



let requireAll = requireContext => {
  requireContext.keys().forEach(requireContext);
};

describe('WizardsContainer', ()=>{
  let wrapper
  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <WizardsContainer/>
    )
  });

  it('Should render Wizard components with the given state', ()=>{
    wrapper.setState({
      wizards: [
        {name: 'Ian', id: 1, average_rating: 83 },
        {name: 'James', description: 'A description'}
      ]
    })
    // Expected Object({ id: 1, name: 'Ian', imgUrl: undefined, avg_rating: undefined }) to equal Object({ name: 'Ian', id: 1, description: 'A description' })

    expect(wrapper.find(WizardTile).at(0).props()).toEqual({name: 'Ian', id: 1, imgUrl: undefined, avgRating: 83})
    expect(wrapper.find(WizardTile).at(1).props().name).toEqual('James')
    // .toBePresent();
  })

  // it('Should fetch wizard data and save it to state', ()=>{
  // let data = {
  //   wizards: [
  //     {name: 'Ian', description: 'A description'},
  //     {name: 'James', description: 'A description'}
  //   ]
  // }
  // let responseBody = JSON.stringify(data);
  // let response = new Response(responseBody, {
  //   status: 200,
  //   statusText: 'OK',
  //   headers: { 'Content-Type': 'application/json' }
  // });
  // let responsePromise = Promise.resolve(response);
  // spyOn(global, 'fetch').and.returnValue(responsePromise);
  // expect(global.fetch).toHaveBeenCalled
  // wrapper.instance().forceUpdate();
  // expect(wrapper.state()).toEqual(data)
  // expect(wrapper.spy)
  // spyOn(WizardsContainer, 'componentDidMount')
  // expect(WizardsContainer.componentDidMount).toHaveBeenCalled
  // })
})
