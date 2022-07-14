import { render } from '@testing-library/react';
import Seeker from '../components/Body/Seeker';

test('Correcto renderizado de Seeker', async () => {
    const seeker =  render(<Seeker />)
     expect(seeker.container).toBeInTheDocument();
});