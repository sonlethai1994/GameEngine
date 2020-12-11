#pragma once

#include "GameEngine/Renderer/GraphicsContext.h"

struct GLFWwindow;

namespace GameEngine
{
	class GE_API OpenGLContext : public GraphicsContext
	{
	public:
		OpenGLContext(GLFWwindow* windowHandle);

		virtual void Init() override;
		virtual void SwapBuffers() override;
	private:
		GLFWwindow* m_windowHandle;
	};
}