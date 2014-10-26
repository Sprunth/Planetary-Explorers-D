module Display;

import std.traits;

import dsfml.graphics;

import DrawableObject;
import GameObject;

class Display : IUpdateable, IDrawable
{
	
	DrawableObject[] toDraw; 

	RenderTexture parentTarget, target;

	Sprite spr;

	CircleShape cs;

	this(RenderTexture parentTarget)
	{
		this.parentTarget = parentTarget;
		target = new RenderTexture();
		
		spr = new Sprite();

		cs = new CircleShape();
		cs.radius = 5;
		//cs.position = new Vector2f(40f, 70f);
		cs.fillColor = Color.Green;
		toDraw[toDraw.length] = cs;
	}

	void Update()
	{

	}

	void Draw(DrawLayer dl, RenderTexture target)
	{
		target.clear();

		foreach (i, member; EnumMembers!DrawLayer)
		{
			foreach (d; toDraw)
			{
				d.draw(i, target);
			}
		}

		target.display();
		spr.setTexture(target.getTexture());
		parentTarget.draw(spr);
	}
}
