module GameObject;

import dsfml.graphics;

interface IUpdateable
{
	void Update();
}

interface IDrawable
{
	void Draw(DrawLayer dl, RenderTarget target);
}

enum DrawLayer {Background=0, LocalBackground, LowDraw, HighDraw, TopDraw, UI}

