module Display;

import std.traits;

import dsfml.graphics;

import DrawableObject;
import GameObject;

class Display : IUpdateable, IDrawable
{
	DrawableObject[] toDraw; 

	RenderTarget parentTarget, target;

	this(RenderTarget parentTarget)
	{
		this.parentTarget = parentTarget;
		target = new RenderTarget();
		
	}

	void Update()
	{}

	void Draw(DrawLayer dl, RenderTarget target)
	{
		foreach (i, member; EnumMembers!DrawLayer)
		{
			foreach (d; toDraw)
			{
				d.draw(i, target);
			}
		}
	}
}
